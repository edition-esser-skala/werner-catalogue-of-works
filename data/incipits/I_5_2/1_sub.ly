\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante molto"
    R1
    r8 f'-\solo \tuplet 3/2 4 { g, a b } a( f) c d16( g)
    \tuplet 3/2 4 { f8 g a b a g } a c4 f8
    a c, \tuplet 3/2 4 { f g a } g h, \tuplet 3/2 4 { e f g }
    f a,16 h c8 d g,4 r
    r16 e-\tutti g c e g c g e g c, e g, c e, g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante molto"
    R1
    r8 a'-\solo \tuplet 3/2 4 { e f g } f c a b
    c4 r8 c f c'16 b a g f8
    r a4 d8 r g,4 c8
    f,4.\trill f8 e4 r
    r16 c-\tutti e g c e g e c e g, c e, g c, e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Andante molto" \autoBeamOff
    f2^\solo a16[ b a b] c8 d
    \tuplet 3/2 4 { c[ b a] b[ a g] } a4 r8 b
    \tuplet 3/2 4 { a[ g f] g[ f e] } f4 a~
    \tuplet 3/2 4 { a8[ h c] d[ e f] g,[ a h] c[ d e] }
    f,4.\trill f8 e g4^\tutti g8
    g c e g e4 c
  }
}

SopranoLyrics = \lyricmode {
  Sub tu -- um prae --
  si -- di -- um con --
  fu -- gi -- mus, San --
  cta __ De -- i __
  Ge -- ni -- trix. No -- stras
  de -- pre -- ca -- ti -- o -- nes,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Andante molto" \autoBeamOff
    R1*4
    r2 r8 e4^\tutti e8
    e g g c g4 e
  }
}

AltoLyrics = \lyricmode {
  No -- stras
  de -- pre -- ca -- ti -- o -- nes,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "Andante molto" \autoBeamOff
    R1*4
    r2 r8 c4^\tutti c8
    c e g e c4 c
  }
}

TenoreLyrics = \lyricmode {
  No -- stras
  de -- pre -- ca -- ti -- o -- nes,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante molto" \autoBeamOff
    R1*4
    r2 r8 c'4^\tutti c8
    c c, c' c c4 c,
  }
}

BassoLyrics = \lyricmode {
  No -- stras
  de -- pre -- ca -- ti -- o -- nes,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante molto"
    f8-\solo a16 g f8 e d c16 b a8 b
    c4 c, f r
    R1
    f'4. d8 e4. c8
    d c16 h a8 \hA h c c'4-\tutti c8
    c c, c' c c4 c,
  }
}

BassFigures = \figuremode {
  r2. <6>4
  <6 4> <5 3>2.
  r1
  <5>4 <6> <5!> <6>
  r q2.
  r1
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
