\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    R2.
    r4 a''2~
    a4 gis e
    f2 g8 f
    e( d) e4 f8 e
    d( cis) d4 e8 d
    cis d e4 a,
    R2.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    r4 d'2~
    d4 cis a
    b! h cis
    d a8( b) b8.\trill a32 b
    c!4 g8( a) a8.\trill g32( a)
    b4 f8( g) g8.\trill f32( g)
    a8 h cis4 d8.\trill \hA cis32( d)
    e4 h cis8.\trill \hA h32( \hA cis)
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    R2.*6
    r4 a'2~
    a4 gis e
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    d8. e16 f4 d
    a' a, r
    R2.*6
  }
}

BassFigures = \figuremode {
  r2.
  <4>4 <_+>2
  r2.*6
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
