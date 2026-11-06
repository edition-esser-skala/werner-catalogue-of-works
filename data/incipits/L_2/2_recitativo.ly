\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    g8. g16 c8 e h h d d16 e
    c8 c g g16 a b8. b16 c8 g
    a r16 a a a h c c8. g16 g4
    R1
  }
}

SoliLyrics = \lyricmode {
  Kin -- der lährnts bräf drauf und ſagts mär bald
  auf, I kan enkh nit län -- ger mehr da --
  ſtehn I muß auf dö Bohn -- thä -- tung gehn.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c2 d
    e e
    f g
    c, r
  }
}

BassFigures = \figuremode {
  r2 <6>
  q <5->
  r <4>4 <3>
  r1
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
