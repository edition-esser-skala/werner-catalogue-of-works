\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Allegro"
    d'4. d16 e f8 f r4
    e4. e16 f g8 g r4
    f4. f16 g a8 a r a
    b16 a g8 c, g' a16 g f8 r f
    g16 f e8 a, e' f cis d16 a' g f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Allegro"
    d'4 r r8 d, d' d
    d4 cis r8 e, e' e
    e4 d r8 f f f
    g, e' e e f, d' d d
    e, cis' cis cis d,16 b' a g f f' e d
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1*5
  }
}

BassFigures = \figuremode {
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
