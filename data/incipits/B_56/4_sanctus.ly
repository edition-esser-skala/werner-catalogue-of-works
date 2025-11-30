\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
    r4 g'-\tutti g
    g g r
    R2.*6
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
    r4 e-\tutti h
    c c r
    R2.*6
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'' h
    g g r
    R2.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e' d
    c c r
    R2.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c'^\tutti d
    e2 e4
    d8[^\solo f] e[ d] c[ h]
    c2 cis4
    d8[ cis d e] f[ d]
    e2 e4
    a, d2~
    d4 g,2
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus
  Do -- mi -- nus
  De -- us,
  De -- us
  Sa -- ba --
  oth, san --
  ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'^\tutti g
    g g r
    R2.*6
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e^\tutti h
    c c r
    R2.*5
    r4 d^\solo h
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,

  san -- ctus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c'^\tutti g
    e c r
    R2.*2
    r4 a'^\solo f
    g8[ b] a[ g] f[ e]
    f2 fis4
    g8[ fis g a] h[ g]
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,

  san -- ctus
  Do -- mi -- nus
  De -- us,
  De -- us
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4-\tutti c' g
    e c c'-\solo
    h gis e
    a, a' g
    f2 d4~
    d cis2
    d c4
    h2 g'4
  }
}

BassFigures = \figuremode {
  r2.
  r
  <6\\>
  r2 <4\+>4
  <6>2.
  <4 2>4 <6>2
  r <4\+>4
  <6>2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
