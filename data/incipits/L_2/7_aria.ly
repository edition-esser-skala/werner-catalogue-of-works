\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Tempo giusto"
    \partial 8 c'8 a'8.\trill g32 f e8 d c8.\trill b32 a g8 f \gotoBar "4"
    g'16( c,) h( f') \tuplet 3/2 8 { \sbOn e d c d c h \sbOff } c g e g c,4
    r8 f\p c'16( e) g( b) a( g) f( e) f8 a
    d, c16 b a g f8 f\trill e r4
    r8 e' f g a e, f g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Tempo giusto"
    \partial 8 c'8 a'8.\trill g32 f e8 d c8.\trill b32 a g8 f \gotoBar "4"
    g'16( c,) h( f') \tuplet 3/2 8 { \sbOn e d c d c h \sbOff } c g e g c,4
    r8 f\p c'16( e) g( b) a( g) f( e) f8 a
    d, c16 b a g f8 f\trill e c'4
    c8 c c c, c c c4
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    \partial 8 r8 R1 \gotoBar "4"
    r2 r4 r8 c
    f8. e32[ d] c8 b a8. g16 f8 f'
    d c16[ b] a[ g] f8 f e r g'
    \tuplet 3/2 8 { a16[ g f] } e[ d] c8. b16 \tuplet 3/2 8 { a[ g f] } e[ d] c8 c'
  }
}

SoliLyrics = \lyricmode {
  Ein
  Zim -- mer -- mann der et -- was khan iſt
  al -- ler -- dings zu lo -- ben, weil
  er ſich plagt ſein Le -- ben wagt biß
}

Continuo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Tempo giusto"
    \partial 8 r8 f, f' c' b a f e d \gotoBar "4"
    e d c g c c'~ c16 b! a g
    f8 a e4 f8 f,16 g a8 f
    b4 r8 h c c' a e
    f g a e f g a e
  }
}

BassFigures = \figuremode {
  r8 r1
  <6>8 <6!>4 <_!>8 r2
  r4 <6>8 <5> r2
  r <4>8 <3> <6> r
  r <6> q q4 q8 q q
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
        \set Staff.instrumentName = "Barthlme"
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
