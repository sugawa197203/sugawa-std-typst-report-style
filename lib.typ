#import "@preview/codelst:2.0.2": *
#import "@preview/showybox:2.0.4": *

#let use-sugawa-style(doc) = {
	set text(
		lang: "ja",
		font: ("Times New Roman", "MS Mincho")
	)
	show heading: set text(font: ("Arial", "MS Gothic"))
	set par(first-line-indent: 1em)
	show heading: it => {
		it
		par(text(size: 0pt, ""))
	}
	doc
	show raw: set text(font: ("JetBrains Mono", "MS Gothic"))
	set heading(
		numbering: (..args) => {
			[演習課題#numbering("1.1", ..args.pos())#h(0.5em)]
		},
	)
	show figure.where(kind: table): set figure.caption(position: top)
	show figure.where(kind: image): set figure.caption(position: bottom)
	show figure.where(kind: raw): set figure.caption(position: bottom)
	show figure.where(kind: block): set figure.caption(position: top)
	
	show figure: it => {
		v(0.5em)
		it
		v(0.5em)
	}

}

#let title(titlename, yourname: "", yournumber: "", date: "", titlesize: 2.0em, yournamesize: 1.0em) = [
	#align(center)[
		#text(font: ("Arial", "MS Gothic"), titlename, size: titlesize)
	]
	#align(right)[
		#text(font: ("Arial", "MS Gothic"), {
			let retval = "";
			if date != "" {
				retval = date + " ";
			}
			if yourname != "" {
				retval = retval + yourname + " ";
			}
			if yournumber != "" {
				retval = retval + yournumber;
			}
			retval
		}, size: yournamesize)
	]
	#par(text(size:0em,""))
]

#let fig(caption, ref, figcontent) = [
	#figure(caption: caption)[
		#figcontent
	]#label(ref)
	#par(text(size:0em,""))
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