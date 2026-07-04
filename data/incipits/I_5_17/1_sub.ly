\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c'1 h2
    c r4 c a4. a8
    g4 g a h c d
    e2 d1
    c2 e d~
    d d2. d4
    d2 d2. d4
  }
}

ViolaII = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    e2 g d
    e r4 g f4. f8
    e4 e f g a h
    c2 a2. g8 f
    e1 a2
    g1 fis2
    g r g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c'1 h2
    c r4 c a4. a8
    g4 g a h c d
    e2 d1
    c2 e d~
    d d2. d4
    d2 d2. d4
  }
}

SopranoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- _ gi -- _
  mus, San --
  cta De -- i __
  Ge -- ni --
  trix, no -- stras
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    e2 g d
    e r4 g f4. f8
    e4 e f g a h
    c2 a2. g8[ f]
    e2 e a
    g1 fis2
    g r g
  }
}

AltoLyrics = \lyricmode {
  Sub tu -- _
  um prae -- si -- di --
  um con -- fu -- _ gi -- _
  mus, San -- _
  cta De -- i
  Ge -- ni --
  trix, "no -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    g1 g2
    g r4 c c4. c8
    c2 r r
    r4 e, f g a h
    c2 c2. c4
    h h a2. a4
    h2 r r
  }
}

TenoreLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um
  con -- fu -- _ gi -- _
  mus, San -- cta
  De -- i Ge -- ni --
  trix,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c2 e g
    c, r4 e f4. f8
    c2 r r
    r4 c d e f g
    a2 a4 g fis2
    g d2. d4
    g,2 r r
  }
}

BassoLyrics = \lyricmode {
  Sub tu -- _
  um prae -- si -- di --
  um
  con -- fu -- _ gi -- _
  mus, San -- cta De --
  i Ge -- ni --
  trix,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c2 e g
    c, r4 e f4. f8
    c2 r r
    r4 c d e f g
    a2. g4 fis2
    g d1
    g,2 \clef soprano << { d'''2. d4 } \\ { r2 g, } >>
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r4 <3> q q q q
  r1 <6 5>2
  r <4> <_+>
  r1.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
