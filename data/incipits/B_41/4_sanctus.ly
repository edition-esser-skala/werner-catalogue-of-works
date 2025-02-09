\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    r16 a'\f cis e a8 a, r16 fis a cis fis8 fis,
    r fis' h, g' fis h cis, ais'
    h4 r r8 g a h
    a4. h16 a gis8 h4 a8~
    a gis16 fis gis4\trill a8 cis,(\p d) e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    r4 r16 a cis e a8 a, r16 d fis a
    d8 d4 e8 cis4.\trill cis8
    h d e fis g4. fis8
    e cis d4. e16 d cis8 d
    \grace cis h4.\trill h8 cis a(\p h) cis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    cis'2.^\tutti d4
    d4. e8 cis2
    h8 d e fis g4. fis8
    e cis d4. e16[ d] cis8[ d]
    \grace cis h4.\trill h8 a4 r
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus, san --
  ctus Do -- mi -- nus De -- us,
  De -- us, De -- _ us __
  Sa -- ba -- oth.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e2^\tutti fis
    fis8.[ g32 a] h8[ g] fis2
    fis4 r r8 g a h
    a4. h16[ a] gis4 a~
    a gis a r
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus, san --
  ctus Do -- mi -- nus
  De -- us Sa -- _
  ba -- oth.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a2^\tutti a
    h2. ais4
    h8 h cis d e4. d8
    cis[ e] a,[ d] h e4 fis8
    e4. e8 e4 r
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- _
  ctus Do -- mi -- nus De -- us,
  De -- us, __ De -- _ us
  Sa -- ba -- oth.
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'2^\tutti fis4 d
    h8[ h'] g[ e] fis2
    h,4 r r8 e fis g
    a4 fis8[ d] e4 a8[ d,]
    e4. e8 a,4 r
  }
}

BassoLyrics = \lyricmode {
  San -- _ ctus,
  san -- ctus, san --
  ctus Do -- mi -- nus
  De -- us, __ De -- us __
  Sa -- ba -- oth.
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Largo"
    a'2-\tutti fis4 d
    h8 h' g e fis4 fis,
    h r r8 e fis g
    a4 fis8 d e4 a8 d,
    e4 e, a r8 e
  }
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
  >>
}
