{% macro print_something(args1,args2)%}
    {{print("Running some macros:" ~ args1 ~args2)}}
{% endmacro %}