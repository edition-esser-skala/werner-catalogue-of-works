\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Allegretto mà non troppo"
    \partial 8 f8\pocoF \tuplet 3/2 8 { b16[ a b] } d c b a
    b8 b, b'
    \tuplet 3/2 8 { b16[ c b] } a g f es
    d b32 c d16 es f8
    r16 a32 b c16 d e8
    r16 f,32 g a16 b c8
    r16 d8 b d16
    g,32( f g) a-! b([ a b) c]-! d( c d) e-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Allegretto mà non troppo"
    \partial 8 f8\pocoF \tuplet 3/2 8 { b16[ a b] } d c b a
    b8 b, b'
    \tuplet 3/2 8 { b16[ c b] } a g f es
    d b32 c d16 es f8
    r16 a32 b c16 d e8
    r16 f,32 g a16 b c8
    r16 b8 g f16
    e32( d \hA e) f-! g([ f g) a]-! b( a b) g-!
  }
}

Soli = {
  \relative c {
    \clef bass
    \key b \major \time 3/8 \autoBeamOff \tempoMarkup "Allegretto mà non troppo"
    \partial 8 f8^\markup \remark "ardito" \tuplet 3/2 8 { b16[ a b] } d[ c] b[ a]
    b8 b, b'
    \tuplet 3/2 8 { b16[ c b] } a[ g] f[ es]
    d8 b d'
    c f, b
    a f c'
    d16[ b] b[ g] g[ f]
    e8 r r
  }
}

SoliLyrics = \lyricmode {
  Fort küh -- ne -- ſte
  Stärk -- he der
  fre -- he -- ſten
  Hel -- den, fort
  ſchrök -- lich -- ſte
  Spi -- ze des
  ſtreit -- ten -- den
  Heers,
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \time 3/8 \tempoMarkup "Allegretto mà non troppo"
    \partial 8 f8 d b f'
    d b b'
    b a16 g f es
    d8 b b'
    a4 g8
    f f, a
    b g b
    c r r
  }
}

BassFigures = \figuremode {
  r8 <6>4.
  r
  r
  r
  <6>4 <6!>8
  r4.
  r4 <6>8
  <_!>4.
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
