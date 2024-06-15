\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    R1*3
    r2 r8 h' e d
    cis e16 d cis8 h cis e4 dis8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    R1*3
    r2 r8 a' a gis
    a e4 e8 e gis a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r8 a^\solo d4. e16[ fis] e8 d
    cis8. h16 a8 d h a g a16[ g]
    fis[ e] d8 d'4. cis16[ d] e8 d
    cis h a4. h8 h4
    a r r2
  }
}

TenoreLyrics = \lyricmode {
  In con -- ver -- ten -- do
  Do -- mi -- nus ca -- pti -- vi -- ta -- tem
  Si -- on, fa -- cti su -- mus
  si -- cut con -- so -- la --
  ti.
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    r2 r4 e8^\solo e
    a[ cis16 h] a8 gis a8. gis16 fis8 fis
  }
}

BassoLyrics = \lyricmode {
  Tunc re -- %4
  ple -- tum est gau -- di -- o os
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d4-\solo fis8 e d4 g8 gis
    a4. fis8 g fis e4
    d8 cis h a gis4 gis'
    a8 gis fis e d4 e
    a, a'8 gis a gis fis4
  }
}

BassFigures = \figuremode {
  r2. <6>8 <5>
  r2. <7>8 <6>
  r4 <6\\>2.
  r2 <6 5>
  r2. <7>8 <6\\>
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

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

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
