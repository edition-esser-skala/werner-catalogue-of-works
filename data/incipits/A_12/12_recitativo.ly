\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    \partial 2 r8^\part Eliphas b b16 b es \hA b
    g8 g g16 as b c \hA as8 as r16 \hA as c \hA as
    f8. f16 f8 d' b as c b
    g g16 \clef soprano b'^\part "Jobs Frau" b b c des c8. g16 g8 \clef tenor g,^\part Eliphas
    g b des c as << \context Voice = "Soli" { \once \stemUp c^\part Job } \\ { as_\markup \remark "Ach" } >> \fC c16 c c d
  }
}

SoliLyrics = \lyricmode {
  Die Peyn iſt al -- zu
  groß, hier muß man bil -- lich ſchwei -- gen, es kan ſich
  wohl daß Loß auf un -- ſern Ruck -- hen
  zei -- gen. Al -- lein er greifft den Schö -- pffer an. Diß
  kan ich ſchwär -- lich glau -- ben. thut mir doch "er -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    \partial 2 << { es2 } \\ { es, } >>
    e' c
    d1
    es2 e~
    e f
  }
}

BassFigures = \figuremode {
  r2 <6> <6- _->
  <6->1
  r2 <6>
  <7- 5> <_->
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
