\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante passato"
    \partial 8 r8 \appoggiatura { d'16[ c] } d8[ \appoggiatura { c16[ b] } c8] \appoggiatura { b16[ a] } b8 es, \appoggiatura { f16[ es] } f8[ \appoggiatura { es16[ d] } es8] d d'
    \appoggiatura { c16[ b] } c8[ \appoggiatura { b16[ a] } b8] \appoggiatura { a16[ g] } a8[ \appoggiatura { g16[ f] } g8] f16( d) es( c) d8 d'\pp
    \appoggiatura { c16[ b] } c8[ \appoggiatura { b16[ a] } b8] \appoggiatura { a16[ g] } a8[ \appoggiatura { g16[ f] } g8] f16( d) es( c) d8 d'
    b16( g) as( f) g8 e' c16( a) b( g) a4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante passato"
    \partial 8 r8 \appoggiatura { f16[ es] } f8[ \appoggiatura { es16[ d] } es8] \appoggiatura { d16[ c] } d8[ \appoggiatura { c16[ b] } c8] \appoggiatura { d16[ c] } d8[ \appoggiatura { c16[ b] } c8] b b'
    \appoggiatura { a16[ g] } a8[ \appoggiatura { g16[ f] } g8] \appoggiatura { f16[ es] } f8[ \appoggiatura { es16[ d] } es8] d16( b) c( a) b8 b'\pp
    \appoggiatura { a16[ g] } a8[ \appoggiatura { g16[ f] } g8] \appoggiatura { f16[ es] } f8[ \appoggiatura { es16[ d] } es8] d16( b) c( a) b8 b'
    g16( es) f( d) c8 c' a16( f) g( e) f4
  }
}

Soli = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante passato"
    \partial 8 b'8 b4 b,8 b' b4 b,8 b
    f' f f g16[ a] b4 r8 b,\p
    f' f f g16[ a] b4 b8\f b,
    g' r c c, a' r r b16[ d]
  }
}

SoliLyrics = \lyricmode {
  Bey Schwabn -- würth bey Schwabn -- würth da
  hed mär Dorf ä Zürd da
  hed mär Dorf ä Zürd, wär ſchon
  Mann der was khan die
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante passato"
    \partial 8 r8 b c d c b c d b'
    a g f es d c b b'\p
    a g f es d c d\f b
    es d e c f c f, d'
  }
}

BassFigures = \figuremode {
  r8 r1
  r1
  r
  r4 r4. <_!>4 <6>8
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
