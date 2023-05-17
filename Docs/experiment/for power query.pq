//
let
    Letters = {"a".."z"},
    Str = [ Null = "␀" ],
    // quick function to csv-ify a list, if possible.
    // did you know let expressions are actually
    // sugar for record expressions? for example
    ToCsv = (source as list) as text => [
        items = List.Transform(
            source,
            (item) =>
                try Text.From(item)
                catch (e) => Str[Null]
        ),
        join = "{ " & Text.Combine(items, ", " ) & " }"
    ][join],

    // another way to preview, if the default conversion is good enough
    ToJson = (source as any) as any =>
        let
            bytes = Json.FromValue(source),
            lines = Text.FromBinary( bytes, TextEncoding.Utf8 )
        in
            lines,

    numChars = List.Count(Letters),
    tests = {
        [ Start = 0, Count = null ],
        [ Start = 0, Count = 3 ],
        [ Start = 3, Count = 4 ],
        [ Start = 8, Count = null ],
        [ Start = 8, Count = 9999 ],
        [ Start = numChars -3, Count = null ]
    },
    Summary = [
        Letters = Letters
    ],
    Custom1 = ToJson( {0..4} )
in
    Custom1


//     Letters = { "a".."z" },
//     Custom1 = Letters,
//     Custom2 = List.Range( Custom1, 0, null ),
//     Summary = [
//         Source = Letters,
//         SourcePreview = ToCsv( Source ),

//         #"Letters, 0" = ToCsv( List.Range( Letters, 0 ) ),
//         #"Range( l, 0 )"        = ToCsv( List.Range( Letters, 0, null ) ),
//         #"Range( l, 4 )"        = ToCsv( List.Range( Letters, 4, null ) ),
//         #"Range( l, 0, 3 )"        = ToCsv( List.Range( Letters, 0, 3 ) ),
//         #"Range( l, 8, null )"        = ToCsv( List.Range( Letters, 8, null ) ),
//         #"Range( l, 8, 3 )"        = ToCsv( List.Range( Letters, 8, 3 ) ),
//         #"Range( l, 8, 300 )"        = ToCsv( List.Range( Letters, 8, 300 ) ),
//         #"Range( l, 0, null )"  = ToCsv( List.Range( Letters, 0, null ) ),


//         Slice1 = ToCsv( Source ),
//         stuff = ...
//     ]
// in
//     Summary