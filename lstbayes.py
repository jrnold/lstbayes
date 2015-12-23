import json
import re
import sys

import jinja2

def main():
    with open("stan-mode/stan-lang/stan_lang.json", "r") as f:
        data = json.load(f)

    keywords = sorted(data['keywords']
                      + data['pseudo_keywords']
                      + data['function_like_keywords'])

    functions = sorted([x for x in data['functions']
                        if not re.match("^operator", x)
                        and x not in keywords])
    distributions = sorted(data['distributions'])
    keywords3 = sorted(functions + distributions)

    env = jinja2.Environment(block_start_string = '<%',
                             block_end_string = '%>',
                             variable_start_string = '<<',
                             variable_end_string = '>>',
                             comment_start_string = '<!',
                             comment_end_string = '!>',
                             loader = jinja2.FileSystemLoader('.'))

    template = env.get_template('lstbayes_template.dtx')
    rendered = template.render({'keywords3': keywords3, 'version': data['version']})
    with open('lstbayes.dtx', 'w') as f:
        f.write(rendered)

if __name__ == '__main__':
    main()

