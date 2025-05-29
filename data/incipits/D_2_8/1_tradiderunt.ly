\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
    r4 g'8 g es8. es16 es8 c
    as' as as as as g r g
    g4 d8 es f f as f
    e8. e16 e4 r g8 c,
    as'4. g8 fis4 fis
    fis fis8 g g d r4\fermata \bar "||"
  }
}

AltoLyrics = \lyricmode {
  Tra -- di -- de -- runt me in
  ma -- nus im -- pi -- o -- rum, et
  in -- ter in -- i -- quos pro -- ie --
  ce -- runt me, et non
  pe -- per -- ce -- runt
  a -- ni -- mae me -- ae.
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Recitativo"
    c1-\solo
    c4 d es2
    h1
    b2 e,
    f d'!
    d d4 g,\fermata \bar "||"
  }
}

BassFigures = \figuremode {
  r1
  <6->
  r
  <4! 2>
  <_->2 <_+>
  r <4>8 <_+>4.
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
