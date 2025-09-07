\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    f'2 e~
    e4 d8 cis d4 h
    cis2 r
    R1*2
    r4 d4. c16 b c8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    a'2 a
    a2. gis4
    a2 r
    r4 a4. g!16 f g8 e
    f d f g a2
    d, r4 a'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    a'2 a
    a2. gis4
    a2 r
    R1*2
    r4 d4. c16[ b] c8[ a]
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- _
  ctus,

  san -- _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    f2 e
    f1
    e2 r
    r4 a4. g16[ f] g8[ e]
    f[ d f g] a2
    d, r4 a'~
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san --
  ctus,
  san -- _ _
  _ _
  ctus, "san -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    d2 a4 e'~
    e d8[ cis] d4 h
    cis2 r
    R1
    r4 d4. c!16[ b] c8[ a]
    b[ g] b[ a16 g] fis2
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san --
  _ _ _
  ctus,

  san -- _ _
  _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    d2. cis4
    d1
    a4 a'4. g16[ f] g8[ e]
    f[ d] f4 cis2
    d4. e8 fis[ g a \hA fis]
    g4 g d2
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san --
  ctus, san -- _ _
  _ ctus, san --
  _ _ _
  _ ctus, "san -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Presto"
    d2.-\tutti cis4
    d1
    a4 a'4.-! g16-! f-! g8-! e-!
    f-! d-! f4 cis2
    d4. e8 fis g a \hA fis
    g2 d
  }
}

BassFigures = \figuremode {
  r2 <2>
  <9>4 <8>2 <6 4\+ 3>4
  r1
  r4 <10> <6> <5>
  <_!>2 <6>
  r <8 _+>4 <7 \t>
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
