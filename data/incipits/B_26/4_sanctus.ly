\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    g'4. a8 h c d e
    f2 e8 d c h
    ais4 h2 a4~
    a8 g16 fis g2 fis4
    r8 h e d cis4 d8 fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    h4. c8 d g, g'4
    f8 e d4 e e
    fis4. g8 fis4~ fis16 e fis8
    h,4 e2 d4
    d8 g4 h8 e,4 fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4.^\tutti a8 h[ c d e]
    f2 e8[ d] c[ h]
    ais4 h2 a4~
    a8[ g16 fis] g2 fis4
    r8 h e d cis4 d
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ ctus,
  san -- _ _
  _ ctus
  Do -- mi -- nus De -- us,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    h4.^\tutti c8 d[ g,] g'4
    f8[ e] d4 e e
    fis4. g8 fis4~ fis16[ e fis8]
    h,4 e2 d4
    d8 g4 h8 e,4 fis
  }
}

AltoLyrics = \lyricmode {
  San -- _ _ _
  _ ctus, san -- ctus,
  san -- ctus, san --
  ctus, san -- ctus
  Do -- mi -- nus De -- us,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 g4.^\tutti a8[ h c]
    d4. c8 h4 a8[ h]
    cis4 d \hA cis4. dis8
    e e,4 fis16[ g] a!4. d8
    h4. h8 a4 a8 a
  }
}

TenoreLyrics = \lyricmode {
  San -- _
  _ _ _ ctus,
  san -- ctus, san -- _
  _ _ _ _ ctus,
  san -- ctus Do -- mi -- nus
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g4^\tutti g'2 f8[ e]
    d[ c h a] gis[ e'] a8[ g]
    fis![ e] d[ e] fis2
    e4. d8 cis4 d
    g,2 a8 a' fis d
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  _ _ ctus,
  san -- ctus, san --
  _ ctus, san -- _
  _ ctus Do -- mi -- nus
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Largo"
    g4-! g'2 f8 e
    d c h a gis4 << { a'8 g } \\ { a,4 } >>
    fis'!8 e d e fis2
    e4. d8 cis4 d
    g,2 a8 a' fis d
  }
}

BassFigures = \figuremode {
  r2. <6 4>8 <6>
  <_!>4. \once \bassFigureExtendersOn q8 <6>8 <5> <3> q
  <_+>4 <6>4 <5\+ 4> <\t _!>8 <6\\ \t>
  <4>4 <3> <6 5>2
  <5>4 <6> <_+>2
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
