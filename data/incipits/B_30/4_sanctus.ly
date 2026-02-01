\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    c'4 r8 g c e
    g4 r8 cis, e \hA cis
    a a'16 g a8 f16 e f8 d16 cis
    d8 g f d' a, cis
    d f,16 e f8 a d f
    r b,16 a \hA b8 d g b
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    e4 r8 e g c
    e4 r8 a, cis e
    f a16 g a8 f16 e f8 d16 cis
    d8 g f d' a, cis
    d f,16 e d8 f a d
    r g,16 fis g8 b d g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    c'4^\tutti c r
    cis cis r
    d2.~
    d8 e d4 cis
    d8 a a a f'4
    d r8 g, b d
  }
}

SopranoLyrics = \lyricmode {
  an -- ctus,
  san -- ctus,
  san --
  ctus, san -- _
  ctus Do -- mi -- nus De --
  us, Do -- mi -- nus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    g'4^\tutti g r
    g g r
    a4. a8 f4~
    f8 g f4 e
    d r8 f a f
    f d b'4. b8
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus, san --
  ctus, san -- _
  ctus Do -- mi -- nus
  De -- us Sa -- "ba -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    e4^\tutti e r
    e e r
    f2 d4~
    d8[ b] a2
    a4 r8 a a a
    d, d'4 b g8
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus, __
  san --
  ctus Do -- mi -- nus
  De -- _ _ us,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    r8^\tutti c'16[ h] c8[ g] e[ c]
    r g'16[ f] g8[ e] cis[ a]
    r f'16[ e] f8[ d16 cis] d8[ b'16 a]
    b8 g a4 a,
    d r8 d f d
    b'4 g, r
  }
}

BassoLyrics = \lyricmode {
  San -- _ ctus,
  san -- _ ctus,
  san -- _ _
  _ ctus, san -- _
  ctus Do -- mi -- nus
  De -- us,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Andante"
    c8-\tutti c'16 h c8 g e c
    r g'16 f g8 e cis a
    r f'16 e f8 d16 cis d8 b'16 a
    b8 g a4 a,
    d r8 d'16 a f8 d
    b'4 g, r8 g
  }
}

BassFigures = \figuremode {
  r2.
  r8 <4\+ 2> r2
  r8 <6> r2
  r8 <6> <6 4>4 <5 _+>
  r2.
  <5>2.
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
