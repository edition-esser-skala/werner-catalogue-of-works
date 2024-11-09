\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'2 g'4. g8
    g4 e4. f16 g a8 g
    f g16 a g2 g8 a
    g4. g8 g e d c
    h d c d e4. e8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    r2 r4 g'
    c4. c8 c4 a~
    a8 h16 c d8 c h4 c~
    c h c r
    r8 a g f e g c h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r4 g'^\tutti
    c4. c8 c4 a~
    a8 h16 c d8 c h4 c~
    c h c8 e d c
    h d c d16 d e4 e8 e
  }
}

SopranoLyrics = \lyricmode {
  Ma --
  gni -- fi -- cat a --
  ni -- ma me -- a Do -- _
  mi -- num, et ex -- ul --
  ta -- vit spi -- ri -- tus me -- us in
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    c2^\tutti g'4. g8
    g4 e4. f16 g a8 g
    f g16 a g2 g8[ a]
    g4. g8 g4 r
    r8 a g f e[ g] c h
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma me -- a,
  a -- ni -- ma me -- a __
  Do -- mi -- num,
  et ex -- ul -- ta -- vit in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 e^\tutti d h8 d
    g,4. a16 h c4 c
    r8 a h c d4 e8[ d]
    d4. d8 e4 r8 c
    d a16[ h] c8[ h] c e c e
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a,
  a -- ni -- ma me -- a __
  Do -- mi -- num, et
  ex -- ul -- ta -- vit in De -- o
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 c'^\tutti h8[ a] g f
    e d c4 a'8[ g] f e
    d'[ c] h a g[ f] e[ f]
    g4. g8 c, c' h a
    g f e d16 d c8[ h] a g'
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma, a -- ni -- ma,
  a -- ni -- ma me -- a __
  Do -- mi -- num, et ex -- ul --
  ta -- vit spi -- ri -- tus me -- us in
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c8-\tutti e' d c h a g f
    e d c h << { a' g f e } \\ { a,4 s } >>
    d8 c h a << { g' f e f } \\ {  g,4 s} >>
    g'8 f g g, c c' h a
    g f e d << { c' h a g } \\ { c,4 s } >>
  }
}

BassFigures = \figuremode {
  r1
  r
  r2. <6>8 <6 5>
  <4>4 <3>2.
  r8 <6> q q2 q8
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
