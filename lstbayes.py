import json
import re
import sys
import datetime

import jinja2

def main():
    pkgversion = datetime.date.today().strftime("%Y/%m/%d")

    with open("stan-language-definitions/stan_lang.json", "r") as f:
        data = json.load(f)

    functions = sorted(data['functions']['names']['all'])
    distributions = [re.sub(r'_p[dm]f$', '', x)
                     for x in sorted(data['functions']['names']['density'])]
    keywords3 = sorted(functions + distributions)

    env = jinja2.Environment(block_start_string = '<%',
                             block_end_string = '%>',
                             variable_start_string = '<<',
                             variable_end_string = '>>',
                             comment_start_string = '<!',
                             comment_end_string = '!>',
                             loader = jinja2.FileSystemLoader('.'))

    template = env.get_template('lstbayes_template.dtx')
    rendered = template.render({'keywords3': keywords3,
                                'version': data['version'],
                                'pkgversion': pkgversion})
    with open('lstbayes.dtx', 'w') as f:
        f.write(rendered)

if __name__ == '__main__':
    main()
