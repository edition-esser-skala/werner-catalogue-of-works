\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 6/8 \tempoMarkup "Allegro assai"
    \partial 8 b'8 b4\trill f'8 d b f
    b4\trill f'8 d b f
    b f b d b d
    f a,16\p b c d c8 a f
    f' a,16 b c d c8 a f
    f' f, f f' f, f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 6/8 \tempoMarkup "Allegro assai"
    \partial 8 b'8 b4\trill f'8 d b f
    b4\trill f'8 d b f
    b f b d b d
    f f,16\p g a b a8 c a~
    a f16 g a b a8 c a
    f' f, f f' f, f
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 6/8 \tempoMarkup "Allegro assai"
    \partial 8 b8 b4\trill f'8 d b f
    b4\trill f'8 d b f
    b f b d b d
    f \mvTr f,\p-\tasto f f f f
    f f f f f f
    f f f f f f
  }
}

BassFigures = \figuremode {
  %tacet
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
