\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    f,8^\part Leviathan f b16 b b d g,8 g g f
    as8. as16 as8 g es r es' c
    a! g b a fis fis d' b
    g4 r8 g g8. d16 d4
    \clef bass r8^\part Schöpffer g h!16 h c d es,8 c' b16 f as \hA b
  }
}

SoliLyrics = \lyricmode {
  Al -- les geth nach Wunſch und Wil -- len, nun find
  ſich Ver -- zweiff -- lung ein, reitz ich
  ihn zum Werks -- er -- fül -- len, ſoll diß
  mein Ver -- gnü -- gen ſein.
  Du ir -- reſt all -- zu weith in dei -- nen Ur -- "theil -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    b2 h
    h c
    cis d
    es4 es8 cis d2
    h! c4 d
  }
}

BassFigures = \figuremode {
  r2 <6>
  <7- 5> <_->
  <6 5> <_+>
  r4 <\t>8 q <4>4 <_+>
  <6>2 <_->4 <6->
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
