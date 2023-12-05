import os
import types
from contextvars import ContextVar

from jinja2 import Environment, FileSystemLoader
from werkzeug.exceptions import HTTPException, MethodNotAllowed, NotFound
from werkzeug.local import LocalProxy
from werkzeug.routing import Map, Rule
from werkzeug.serving import run_simple
from werkzeug.wrappers import Request, Response

_request_ctx_var: ContextVar[str] = ContextVar("request")
request: Request = LocalProxy(_request_ctx_var)

template_dir = os.path.join(os.path.dirname(__file__), "templates")
jinja_env = Environment(loader=FileSystemLoader(template_dir), autoescape=True)

def render_template(template_name, **context):
    template = jinja_env.get_template(template_name)
    return template.render(context)



def _get_endpoint_name(endpoint: str | types.FunctionType) -> str:
    

    if isinstance(endpoint, types.FunctionType):
        return endpoint.__name__
    elif isinstance(endpoint, str):
        return endpoint

    raise Exception("_get_endpoint_name expects either a Function or a str")

class Blueprint:

    

    def __init__(self, base_prefix: str, prefix_endpoint: str = None) -> None:
        

        
        self.url_map = Map()

        
        self.base_prefix = self._add_root_to_route(base_prefix)

        
        if prefix_endpoint is None:
            self.prefix_endpoint = prefix_endpoint
        else:
            self.prefix_endpoint = self._add_prefix_to_route(prefix_endpoint)

        
        if self.base_prefix is not None and self.prefix_endpoint is not None:
            self._add_rule(self.base_prefix, self.prefix_endpoint)

        
        self.endpoints = []

    def _add_root_to_route(self, route: str) -> str:
        

        if not route[0] == "/":
            return f"/{route}"

        return route

    def _add_prefix_to_route(self, route: str) -> str:
        

        route = self._add_root_to_route(route)

        if not route.startswith(self.base_prefix):
            return f"{self.base_prefix}{route}"

        return route

    def _add_rule(self, route: str, endpoint: str | types.FunctionType) -> None:
        
        endpoint_name = _get_endpoint_name(endpoint)

        self.url_map.add(Rule(route, endpoint=endpoint_name))
        self.endpoints.append(endpoint)

    def set_base_prefix(self, prefix_base_of_bp: str) -> None:
        

        self.base_prefix = self._add_root_to_route(prefix_base_of_bp)

    def set_prefix_endpoint(self, endpoint_for_bp_prefix: str) -> None:
        

        self.prefix_endpoint = endpoint_for_bp_prefix

    def route(self, endpoint_route=None, is_prefix_endpoint: bool = False):
        

        if endpoint_route is not None:
            endpoint_route = self._add_prefix_to_route(endpoint_route)

        def wrapped_endpoint(endpoint_function, *args, **kwargs):
            
            if endpoint_route is not None:
                self._add_rule(endpoint_route, endpoint_function)

            
            if (
                endpoint_route is not None
                and is_prefix_endpoint
                and self.prefix_endpoint is None
            ):
                self.set_prefix_endpoint(endpoint_route)

            
            if (
                endpoint_route is None
                and is_prefix_endpoint
                and self.prefix_endpoint is None
            ):
                self.set_prefix_endpoint(endpoint_function)

            
            if is_prefix_endpoint and self.prefix_endpoint is not None:
                self._add_rule(self.base_prefix, self.prefix_endpoint)

        return wrapped_endpoint

    def get_endpoints(self) -> list[str | types.FunctionType]:
        

        return self.endpoints

    def get_map(self) -> Map:
        

        return self.url_map


class wsgi:
    

    def __init__(self) -> None:
        
        self.url_map = Map()
        self._request_ctx_var = _request_ctx_var
        self.request = request

    def dispatch_request(self):
        

        adapter = self.url_map.bind_to_environ(self.request.environ)

        try:
            endpoint, values = adapter.match()
            
            return getattr(self, f"{endpoint}")(**values)

        except HTTPException as thisExept:
            return thisExept

    def app(self, environ, start_response) :
        

        request = Request(environ)
        self._request_ctx_var.set(request)

        response = self.dispatch_request()

        return response(environ, start_response)

    def run(self):
        

        from werkzeug.serving import run_simple

        run_simple(application=self, hostname="localhost", port=8000, use_reloader=True, use_debugger=True)

    def route(self, route):
        

        def wrapped_endpoint(func, *args, **kwargs):
            if isinstance(route, list):
                for r in route:
                    self._add_rule(func, r)
            else:
                self._add_rule(func, route)

        return wrapped_endpoint

    def _add_rule(self, endpoint, route):
        

        endpoint_name = _get_endpoint_name(endpoint)

        if isinstance(endpoint, str):
            self.url_map.add(Rule(route, redirect_to=endpoint_name))
        else:
            self.__setattr__(endpoint_name, endpoint)
            self.url_map.add(Rule(route, endpoint=endpoint_name))

    def register_blueprint(self, blueprint):
        

        bp_map = blueprint.get_map()
        bp_endpoints = blueprint.get_endpoints()

        for e in bp_endpoints:
            for r in bp_map.iter_rules(endpoint=_get_endpoint_name(e)):
                self._add_rule(e, str(r))

    def __call__(self, environ, start_response):
        

        return self.app(environ, start_response)