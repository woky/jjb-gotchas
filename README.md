## A_intro
### Templates
#### `template.yaml`
```
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
### Jobs created
- `a-x`
- `a-y`
- `b-x`
- `b-y`
## B_defaults
### Templates
#### `template.yaml`
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
### Jobs created
- `['a', 'b']-x`
- `['a', 'b']-y`
## C_include
### Templates
#### `template.yaml`
```
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
#### `foo.yaml.inc`
```
- a
- b
```
### Jobs created
- `a-x`
- `a-y`
- `b-x`
- `b-y`
## D_include_empty_file
### Templates
#### `template.yaml`
```
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
#### `foo.yaml.inc`
```
```
### Jobs created
- `None-x`
- `None-y`
## E_include_empty_list
### Templates
#### `template.yaml`
```
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
#### `foo.yaml.inc`
```
[]
```
### Jobs created
## F_include_configuration
### Templates
#### `template.yaml`
```
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
#### `configuration.yaml.inc`
```
foo:
  - a
  - b
```
### Jobs created
- `['a', 'b']-x`
- `['a', 'b']-y`
