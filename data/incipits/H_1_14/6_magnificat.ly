\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    b'16\f d f b \tuplet 3/2 8 { \sbOn c b a a g f \sbOff } f8 d r4
    r16 f, a f c' a f' c d f c f b, d f d
    c( d) a( b) c( d) es( f) d b f d r4
    b'16( d) g,( a) b( c) d( es) f!( d) d( h) r4
    r16 g' g( es) es( c) c8 r16 f f( d) d f c f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    d16\f f b d f c c a d8 b r4
    r16 f a f c' a f' c d f c f b,( f) f( b)
    a( b) c( d) a( b) c( a) b( f) d( b) r4
    d'16( b) b( a) g( a) h( c) d( \hA h) h( d) r4
    r16 es es( c) c( a) a8 r16 d d( b) f d' f, c'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    b'4^\tutti c8. c16 d8 b d b
    f'4 f f4. f8
    f4 r r8 d d d
    d d r4 r8 d8. d16 d8
    es es r c d4. c8
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma
  me -- a Do -- mi --
  num, et ex -- ul --
  ta -- vit spi -- ri -- tus
  me -- us in De -- o
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 f^\tutti f8. f16 f4 r
    r8 a f a f a b8. b16
    a4 r r8 f f fis
    g g r4 r8 f d g
    g g r f f f f f
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num, et ex -- ul --
  ta -- vit spi -- ri -- tus
  me -- us in De -- o sa -- "lu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 d^\tutti c a b4 r
    r8 c c c d c d8. d16
    c4 r r8 b b a
    b b r4 r8 h8. h16 h8
    c c r a b4. c8
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num, et ex -- ul --
  ta -- vit spi -- ri -- tus
  me -- us in De -- o
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 b'^\tutti a f b4 r
    r8 f a f b f d b
    f'4 r r8 b b d
    g, g r4 r8 d g g,
    c c r f b,! b b' a
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num, et ex -- ul --
  ta -- vit spi -- ri -- tus
  me -- us in De -- o, De -- o
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Vivace"
    b8-\tutti b' a f b4 r
    r8 f a f b f d b
    f'4 r r8 b, b d
    g, g r4 r8 d' g g,
    c c r f b,! b b' a
  }
}

BassFigures = \figuremode {
  r1
  r
  r2.. <_+>8
  r2 r8 <6!> <_!>4
  <_->1
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
