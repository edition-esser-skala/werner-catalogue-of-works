\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    r2 r16 a''-\solo f g a8 f
    r b16 g \sbOn \tuplet 3/2 8 { a g f g f e } f8 d r4
    r8 d \tuplet 3/2 8 { c16 b a b a g } \sbOff a4 r
    r8 e16( f) g( b) a( c) \tuplet 3/2 8 { \sbOn g16 f e a g f g f e } e'8 \sbOff
    d16( c) h( c) \hA h( a) g( f) e c' e, f g c e, f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    r2 r16 f'-\solo d e f8 d
    r g16( e) \sbOn  \tuplet 3/2 8 { f e d e d cis } d8 a r4
    r8 f \tuplet 3/2 8 { a16 g f g f e } \sbOff f4 r
    r8 c16( d) e( g) f( a) \sbOn \tuplet 3/2 8 { e d c f e d e d c } c8 \sbOff
    g' g, g h c c16 d e8 c16 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    a'8^\solo d a g f8.\trill e16 d4
    r2 r8 f' \tuplet 3/2 8 { e16[ d c!] d[ c b] }
    c8 r r4 c8 b16[ a] d64[ c b16.] a64[ g f16.]
    e8. d16 c8 c'~ c c, g' c
    h16[ c] d[ c] \hA h[\trill a] g[\trill f] e8.[\trill f32 g] c,4
  }
}

SopranoLyrics = \lyricmode {
  Sub tu -- um prae -- si -- di -- um
  con -- fu -- gi --
  mus, San -- cta De -- i __
  Ge -- ni -- trix, no -- stras de -- pre --
  ca -- ti -- o -- nes no -- stras
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    R1*5
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    R1*5
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    R1*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    d4-\solo cis d r8 d'
    g,4 a d,8 d' c! b
    a b c c, f f, b d
    c4 r r2
    R1
  }
}

BassFigures = \figuremode {
  r1
  <5>8 <6> <6 4> <5 _+> r2
  <6>4 <6 4>8 <5 3> r2
  r1*2
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
