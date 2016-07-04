# docker-openfalcon-alarm

## Build

Enter the following command in the repo directory.

```
$ docker build -t openfalcon-alarm -f docker/ubuntu/Dockerfile .
```

## Run

### Basic Run

Use default configuration, and falcon-alarm package.

```
$ docker run -d --name alarm -p 9912:9912 openfalcon-alarm
```

### Advanced Run

+ Self-defined configuration

    Replace file **cfg.json** in the volume */config*.  
    For more detail about **cfg.json**, see [Alarm](http://book.open-falcon.com/zh/install/alarm.html).

For example, **cfg.json** in /tmp/config,

```
$ docker run -d --name alarm -v /tmp/config/cfg.json:/config/cfg.json -p 9912:9912 openfalcon-alarm
```
