// #import "@preview/codelst:2.0.2": *
#import "@preview/showybox:2.0.4": *


#let use-sugawa-style(doc) = {
    set text(
        lang: "ja",
        font: ("Times New Roman", "MS Mincho"),
    )
    show heading: set text(font: ("Arial", "MS Gothic"))
    show heading: it => {
        it
        par(text(size: 0pt, ""))
    }
    set heading(
        numbering: (..args) => {
            [課題#numbering("1.1.1.", ..args.pos())#h(0.5em)]
        },
        supplement: "",
    )

    set par(first-line-indent: 1em)
    show raw: set text(font: ("JetBrains Mono", "MS Gothic"))
    show figure.where(kind: table): set figure.caption(position: top)
    show figure.where(kind: image): set figure.caption(position: bottom)
    show figure.where(kind: raw): set figure.caption(position: bottom)
    show figure.where(kind: block): set figure.caption(position: top)
    show figure: it => {
        v(0.5em)
        it
        v(0.5em)
    }
    show figure: set text(font: ("Arial", "MS Gothic"))

    // code block
    // inline code
    show raw.where(block: false): box.with(
        fill: luma(230),
        inset: (x: 3pt, y: 0pt),
        outset: (y: 3pt),
        radius: 2pt,
    )

    // code block
    let stripe = true
    show raw.where(block: true): it => {
        let getstripe = i => {
            if stripe {
                if calc.rem(i + 1, 2) == 0 { luma(230) } else { luma(240) }
            } else {
                luma(230)
            }
        }

        let codelines = it.lines.map(i => context [
            #let l = box(
                align(left, if i.text == "" { "" } else { i }),
                width: 100%,
                fill: getstripe(i.number - 1),
                inset: (x: 0.5em, y: 0.3em),
            )
            #l
        ])

        let a = codelines.enumerate()


        grid(
            align(left, block(fill: luma(200), inset: 0.4em, radius: (top: 0.3em))[#it.lang]),
            grid(
                columns: (100%, 96%),
                fill: luma(0),
                column-gutter: -96%,
                table(
                    columns: (3.8%, 96%),
                    inset: 0pt,
                    fill: none,
                    stroke: none,
                    align: horizon + right,
                    ..codelines
                        .enumerate()
                        .map(((i, line)) => (
                            table.cell(
                                fill: getstripe(i),
                                stroke: none,
                            )[#(i + 1)],
                            hide(line),
                        ))
                        .flatten()
                ),
                block(
                    width: 100%,
                    fill: luma(230),
                    grid(
                        // fill: red,
                        columns: 1,
                        ..codelines
                    ),
                ),
            )
        )
    }

    // math
    set math.equation(numbering: "(1)")

    doc
}

#let title(titlename, yourname: "", yournumber: "", date: "", titlesize: 2.0em, yournamesize: 1.0em) = [
    #align(center)[
        #text(font: ("Arial", "MS Gothic"), titlename, size: titlesize)
    ]
    #align(right)[
        #text(
            font: ("Arial", "MS Gothic"),
            {
                let retval = ""
                if date != "" {
                    retval = date + " "
                }
                if yourname != "" {
                    retval = retval + yourname + " "
                }
                if yournumber != "" {
                    retval = retval + yournumber
                }
                retval
            },
            size: yournamesize,
        )
    ]
    #par(text(size: 0em, ""))
]

// 図
#let fig(caption: "", ref: label(""), kind: auto, supplement: auto, figcontent) = [
    #figure(caption: caption, kind: kind, supplement: supplement)[
        #figcontent
    ] #ref
    #par(text(size: 0em, ""))
]

#let itembox = (title: "", body) => showybox(
    title: text(fill: black, title, font: ("Arial", "MS Gothic")),
    title-style: (
        boxed-style: (
            anchor: (x: left, y: horizon),
        ),
    ),
    frame: (title-color: white),
    body,
)

// コードブロック
#let codeblock(caption: "", ref: label(""), coderaw) = fig(
    caption: caption,
    ref: ref,
    kind: raw,
    supplement: "プログラム",
    coderaw,
)

// ソースファイル
#let sourcefile(caption: "", ref: label(""), lang: "plain", file: "") = codeblock(
    caption: caption,
    ref: ref,
    raw(
        if type(file) == str { read(file) } else { file },
        block: true,
        lang: lang,
    ),
)

// 画像
#let img(imagedata: [image], caption: "", ref: label("")) = fig(
    caption: caption,
    ref: ref,
    if type(imagedata) == str { image(imagedata) } else { imagedata },
)


