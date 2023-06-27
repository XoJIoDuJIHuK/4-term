public enum Names {
    Kate,
    Ann,
    Steve,
    John,
    Yriy,
    Pavel,
    Nikita,
    Andrew,
    Pete,
    Liza,
    Sveta,
    Inna;

    public static Names val(int i)
    {
        int l=0;
        if (i>= Names.values().length) i=i%l;
        for (Names n:Names.values())
        {
            if (l==i) return n;
        }
        return null;
    }
}
