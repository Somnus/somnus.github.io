```
    public static TOut1 Mapper<TIn1, TOut1>(TIn1 t1, Action<TIn1, TOut1> action = null)
    {
        MapperConfiguration mapperConfiguration = new MapperConfiguration(p =>
        {
            if (action == null)
            {
                p.CreateMap<TIn1, TOut1>();
            }
            else
            {
                p.CreateMap<TIn1, TOut1>().BeforeMap(action);
            }
        });

        IMapper mapper = mapperConfiguration.CreateMapper();
        TOut1 t2 = mapper.Map<TOut1>(t1);
        return t2;
    }
```
