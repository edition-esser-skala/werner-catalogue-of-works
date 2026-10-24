\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    R1*2
    r16 f\f d16.( f32) d16.( f32) d16.( f32) c16.( f32) c16.( f32) c16.( f32) c16.( f32)
    b16.( d32) b16.( d32) b16.( e32) b16.( e32) f16.( a32) f16.( a32) f16.( a32) f16.( a32)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    R1*2
    r16 d\f b16.( d32) b16.( d32) b16.( d32) f16.( a32) f16.( a32) f16.( a32) f16.( a32)
    b16.( d32) b16.( d32) b16.( e32) b16.( e32) f16.( c32) a16.( c32) a16.( c32) a16.( c32)
  }
}

Soli = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 f~
    f~ f
    d4 r r2
    R1
  }
}

SoliLyrics = \lyricmode {
  Sag --

  fälln
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b8 d' c b a g16 f g8 a
    b f d c16 b f'8 es f f,
    b b' b b a a, a' a
    g g, g' g f f es es
  }
}

BassFigures = \figuremode {
  r1
  r2 <4>4 <3>
  r1
  <5>4 <6!>2 <\t>4
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
        \set Staff.instrumentName = "Sagfäller"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
