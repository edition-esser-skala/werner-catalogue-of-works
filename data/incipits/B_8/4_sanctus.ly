\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \major \time 4/4 \tempoMarkup "Adagio"
    h'4.-\tutti h8 cis4. dis16 e
    h8 e, e'2 d4
    cis8 h a2 g4~
    g8 e16 fis g4 fis8 h h h
    e4. e8 dis dis cis4~
    cis8 cis his his cis4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \major \time 4/4 \tempoMarkup "Adagio"
    gis'4.-\tutti gis8 a e a4~
    a g fis \hA g8 fis
    eis4 fis8 e dis!4 e~
    e4. dis16 cis dis4 r
    r8 gis! gis gis gis gis gis4
    gis4. gis8 gis4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    h'4.^\tutti h8 cis4. dis16[ e]
    h8[ e,] e'2 d4
    cis8[ h] a2 g4~
    g8[ e16 fis] g4 fis8 h h h
    e2 dis4 cis~
    cis his cis8 e^\solo fis a,
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus, san -- _
  _ _ ctus,
  san -- _ _
  _ ctus Do -- mi -- nus
  De -- us Sa --
  ba -- oth. Ple -- ni sunt
}

Alto = {
  \relative c' {
    \clef alto
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    gis'4.^\tutti gis8 a[ e] a4~
    a g fis \hA g8[ fis]
    eis4 fis8[ e] dis!4 e~
    e4. dis16[ cis] dis4 r
    r8 gis! gis gis gis4 gis
    gis4. gis8 gis4 r
  }
}

AltoLyrics = \lyricmode {
  San -- ctus, san -- _
  ctus, san -- ctus,
  san -- _ ctus, san --
  _ ctus
  Do -- mi -- nus De -- us
  Sa -- ba -- oth.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    e4.^\tutti e8 e2~
    e4 h ais h
    gis! fis4. h4 h8
    cis!2 fis,4 r
    r8 cis' cis cis dis4 e
    dis4. dis8 cis4 r
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san --
  ctus, san -- ctus,
  san -- ctus, san -- ctus,
  san -- ctus
  Do -- mi -- nus De -- us
  Sa -- ba -- oth.
}

Basso = {
  \relative c {
    \clef bass
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    e1^\tutti
    e2 fis4 h,
    cis d8[ c] h4 e
    ais,2 h4 r
    r8 cis cis cis his4 cis
    gis'4. gis8 cis,4 r
  }
}

BassoLyrics = \lyricmode {
  San --
  ctus, san -- ctus,
  san -- ctus, san -- ctus,
  san -- ctus
  Do -- mi -- nus De -- us
  Sa -- ba -- oth.
}

Organo = {
  \relative c {
    \clef bass
    \key e \major \time 4/4 \tempoMarkup "Adagio"
    e1~-\tutti
    e2 fis4 h,
    cis d8 c h4 e
    ais,2 h4 r
    r8 cis cis cis his4 cis
    gis2 cis4 dis!-\solo
  }
}

BassFigures = \figuremode {
  <5 _+>2 <6 4>
  <5 \t>4 <8 _!> <7 _+> <6! _!>8 <5 \t>
  <8 _+> <7 \t> <5> r <7 _+>4 <_!>
  <7! 5>2 <_+>
  r8 <5>4. r2
  <4>4 <_+>2 <6>8 <5>
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
        \set Staff.instrumentName = "b"
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
