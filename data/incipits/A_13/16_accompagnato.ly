\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1
    d'2\p^\markup \remark "stendato" c
    b d
    es d
    e1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1
    f2\p^\markup \remark "stendato" fis
    d h'!
    c2. h!4
    a2 g
  }
}

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schöpffer" f, d16 f b f g8 g16 g f c es f
    d8 \clef tenor f^\markup \remark "lamentuoso" ^\part "Gerechtigkeit" b d fis,[ a] c4
    b16[ a] \hA b8 r d h d f! d
    c16[ h!] c8 r16 c es c c8. g16 g4
    r8 a a16 a cis d e8 e r e
  }
}

SoliLyrics = \lyricmode {
  Man hör dem -- nach mit Züt -- tern den Schlus deß
  Ur -- theils an. Nun -- mehr ô fro -- me
  Her -- tzen zer -- flüeſt in bütt -- ren
  Schmer -- tzen, es wei -- ne wer nur kan.
  Er ſoll auf ſei -- nen Ruck -- hen ein
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d2 es4 a,!
    b2\p^\markup \remark "stendato" a
    g f'!
    fis g
    cis,1~
  }
}

BassFigures = \figuremode {
  <6->2. <6>4
  r2 <6\\>
  <_-> <4! _->
  <7- 5> <5 4>4 <\t _!>
  <6>2 <5>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
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
