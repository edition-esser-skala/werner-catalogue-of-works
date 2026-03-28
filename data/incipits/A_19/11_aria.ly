\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 f8-\conSord \sbOn b32( c d es) f16 b, \appoggiatura b8 a8.\trill b16 \tuplet 3/2 8 { b\trill a b b\trill a b b\trill a b b\trill a b } \sbOff \gotoBar "6"
    d,(\p es) f( b,) c( d) es( a,) b16.\f d'32 b16. f32 d4
    r16 d'(\p es f) r c( d es) d( c) b( a) b( f) d( b)
    g'( a) b( f) es( f) g( d) c( d) es( b) a( c) d( es)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 f8-\conSord \sbOn b32( c d es) f16 b, \appoggiatura b8 a8.\trill b16 \tuplet 3/2 8 { b\trill a b b\trill a b b\trill a b b\trill a b } \sbOff \gotoBar "6"
    d,(\p es) f( b,) c( d) es( a,) b16.\f b'32 f16. d32 b4
    r16 b'(\p c d) r a( b c) b( a32 g) f16( es) f( d) d( b)
    g'( a) b( f) es( f) g( d) c( d) es( b) a a b( c)
  }
}

Soli = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    \partial 8 r8 R1 \gotoBar "6"
    r2 r4 r8 f
    d64([ c b16.)] b'8 a64([ g f16.)] f16[ es] d[ es] f[ a,] b8 f'
    g16[ a] b[ f] es[ f] g[ d] c[ d] es[ b] a8 f'
  }
}

SoliLyrics = \lyricmode {
  Waß
  weicht dem ſcharf -- fen Son -- nen -- liecht und
  ſei -- ner Sie -- ges -- wür -- kung nicht? Wan
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Largo"
    \partial 8 \mvTr f8\p-\markup \remark "sempre" d b f' es d g f es \gotoBar "6"
    b'\pp d, es f b,4 b'16.\p f32 d16. f32
    b,8 r f r b c d b
    es d c b a g f f'
  }
}

BassFigures = \figuremode {
  r8 <6>2 <6>8 <3> q q
  r8 <6> <6 5>2.
  r1
  r
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
        \set Staff.instrumentName = "Barak"
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
