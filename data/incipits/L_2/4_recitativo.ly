\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 g h16 h c d a8 r16 a c c e d
    h4 r r2
  }
}

SoliLyrics = \lyricmode {
  Al -- lo ſei ſtät und gmach, ſingts mir hiezt al -- li
  nach.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'2 fis
    g r
  }
}

BassFigures = \figuremode {
  %tacet
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Schullmeiſter"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { indent = 1.5\cm }
}
