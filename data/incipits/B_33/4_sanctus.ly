\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    e'4. d16 cis d8 e
    cis a e' d16 cis h8 a
    gis fis e4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    a'4. a16 gis a8 h
    gis16 fis gis a h8 a4 h8
    e, cis'4 h16 a gis8 fis
    e fis gis fis16 e fis8 gis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    e'4.^\tutti d16[ cis] d8[ e]
    cis a e'[ d16 cis] h8[ a]
    gis[ fis] e4 r
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ ctus, san -- _
  _ ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    a'4. a16[ gis] a8[ h]
    gis16[ fis gis a] h8 a4 h8
    e, cis'4 h16[ a] gis8[ fis]
    e[ fis] gis[ fis16 e] fis8[ gis]
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  _ _ _ _
  ctus, san -- _ _
  _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    e4.^\tutti d16[ cis] d8[ e]
    cis16[ d cis h] a[ h cis d] e8[ d16 cis]
    h4 e, r
    R2.
    e'4. d16[ cis] d8[ e]
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _
  _ _ _
  _ ctus,

  san -- _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4.^\tutti a16[ gis] a8[ h]
    gis[ fis16 e] fis4. gis8
    a8.[ gis16] fis8[ e16 d] cis8[ d]
    e8.[ fis16] gis8[ a fis gis]
    a4 r r
    R2.
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  _ _ ctus,
  san -- _ _
  _ _
  ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4.-\tutti-! a16-! gis-! a8-! h-!
    << { e4. d16 cis d8 e } \\ { gis, fis16 e fis4. gis8 } >>
    a8. gis16 fis8 e16 d cis8 d
    e8. fis16 gis8 a fis gis
    a4 \clef soprano << { e''8 d16 cis h8 a } \\ { cis h16 a gis8 fis } >>
    \clef tenor e4. d16 cis d8 e
  }
}

BassFigures = \figuremode {
  r2.
  r
  <8 3>2 <6>8 q
  r2 q8 q
  r2.
  r2 <6>4
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
