require './config/environment'


use Rack::MethodOverride
use PizzasController
use UsersController
run ApplicationController
