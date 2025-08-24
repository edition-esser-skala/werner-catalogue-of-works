\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r4 g''4. g8 fis g16 a
    h8 a g f e f g f16 e
    d2 c4 f8 d
    e d e f g f e d16 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 c'4. c8
    h c16 d e8 c a h16 c d8 h
    g a h c16 d c8 d e d16 c
    c4 h c r
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 c'4. c8
    h c16[ d] e8 c a[ h16 c] d8 h
    g a h c16[ d] c8 d e d16[ c]
    c4 h c r
    R1
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi --
  te -- bor ti -- bi, Do -- _ mi --
  ne, in to -- to, to -- to cor -- de
  me -- _ o,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*2
    r4 g'4. g8 fis g16[ a]
    h8 a g f e[ f] g[ f16 e]
    d2 c4 f8 d
    e d e f g f e d16[ c]
  }
}

AltoLyrics = \lyricmode {
  Quo -- ni -- am au --
  di -- sti ver -- ba o -- ris
  me -- i, in con --
  spe -- ctu an -- ge -- lo -- rum psal -- lam
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 r4 c~
    c8 c h c16[ d] e2
    d4 c8 e d4. d8
    d4 h r2
    g4. g8 a g a h
    c h c a h d c4
  }
}

TenoreLyrics = \lyricmode {
  Quo --
  ni -- am au -- di --
  sti ver -- ba o -- ris
  me -- i,
  in con -- spe -- ctu an -- ge --
  lo -- rum psal -- lam ti -- bi, "ti -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'4. g8 e f16[ g] a8 f
    d[ e16 f] g8 e c d e f
    g4 c, d2
    g, r
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- _ mi -- ne, in to -- to
  cor -- de me --
  o,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    g'4.-!-\tutti g8-! e-! f16-! g-! << {
      c4~
      c8 c h c16 d e4 s
    } \\ {
      a,8 f
      d e16 f g8 e c d e f
    } >>
    g4 c, d2
    g, \clef soprano << { c''8 d e d16 c } \\ { e,8 f g f16 e } >>
    \clef tenor g,2 a8 g a h
    c h c a h d c4
  }
}

BassFigures = \figuremode {
  r1
  r2. <6>4
  r2 <4>4 <_+>
  r1
  <4>4 <3>2 <6>8 <3>
  q q q <6> q <3> q4
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
