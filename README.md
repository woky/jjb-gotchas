## A_intro
### `template.yaml`
```
- defaults:
    name: 'global'

- job-template:
    name: '{foo}-{bar}'

- project:
    name: derp
    jobs:
      - '{foo}-{bar}'
    bar:
      - x
      - y
    foo:
      - a
      - b
```
### `result.txt`
```
a-x
a-y
b-x
b-y
```
## B_defaults
### `template.yaml`
```
- defaults:
    name: 'global'
    foo:
      - a
      - b

- job-template:
    name: '{foo}-{bar}'

- project:
    name: derp
    jobs:
      - '{foo}-{bar}'
    bar:
      - x
      - y
```
### `result.txt`
```
['a', 'b']-x
['a', 'b']-y
```
## C_include
### `template.yaml`
```
- defaults:
    name: 'global'

- job-template:
    name: '{foo}-{bar}'

- project:
    name: derp
    jobs:
      - '{foo}-{bar}'
    bar:
      - x
      - y
    foo: !include: foo.yaml.inc
```
### `foo.yaml.inc`
```
- a
- b
```
### `result.txt`
```
a-x
a-y
b-x
b-y
```
## D_include_empty_file
### `template.yaml`
```
- defaults:
    name: 'global'

- job-template:
    name: '{foo}-{bar}'

- project:
    name: derp
    jobs:
      - '{foo}-{bar}'
    bar:
      - x
      - y
    foo: !include: foo.yaml.inc
```
### `foo.yaml.inc`
```
```
### `result.txt`
```
None-x
None-y
```
## E_include_empty_list
### `template.yaml`
```
- defaults:
    name: 'global'

- job-template:
    name: '{foo}-{bar}'

- project:
    name: derp
    jobs:
      - '{foo}-{bar}'
    bar:
      - x
      - y
    foo: !include: foo.yaml.inc
```
### `foo.yaml.inc`
```
[]
```
### `result.txt`
```
```
## F_include_configuration
### `template.yaml`
```
- defaults:
    name: 'global'

- job-template:
    name: '{foo}-{bar}'

- project:
    name: derp
    jobs:
      - '{foo}-{bar}'
    bar:
      - x
      - y
    configuration: !include: configuration.yaml.inc
    foo: '{configuration[foo]}'
```
### `configuration.yaml.inc`
```
foo:
  - a
  - b
```
### `result.txt`
```
['a', 'b']-x
['a', 'b']-y
```
