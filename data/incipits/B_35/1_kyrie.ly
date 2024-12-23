\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Ben andante"
    r4 g'4.\fE e8 a4. fis8 h4~
    h8 g c2 h4 c4. a8
    d4. h8 e4 c a d
    h e d e4. fis8 d4~
    d cis d2 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Ben andante"
    r2 c4.\fE a8 d4. h8
    e4. c8 d4 g e a
    fis h g e r fis
    g4. e8 h'4 g4. a8 fis4
    e4. a8 fis4 d4. h8 e4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "Ben andante" \autoBeamOff
    r4 g'4.^\tutti e8 a4. fis8 h4~
    h8[ g] c2 h4 c4. a8
    d4. h8 e4 c a d
    h e d e4. fis8 d4~
    d cis d2 r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e __ _ e --
  lei -- son, Ky -- ri --
  e __ _ e -- _ lei -- _
  son, e -- lei -- _ _ _
  _ son,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \tempoMarkup "Ben andante" \autoBeamOff
    r2 c4.^\tutti a8 d4. h8
    e4. c8 d4 g e a
    fis h g e r fis
    g4. e8 h'4 g4. a8 fis4
    e4. a8 fis4 d4. h8 e4
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e __ _
  e -- _ lei -- _ son, e --
  lei -- _ son, _ e --
  lei -- _ son, e -- _ _
  lei -- _ son, Ky -- ri -- e
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \tempoMarkup "Ben andante" \autoBeamOff
    R1.
    r2 g4.^\tutti e8 a4. fis8
    h4. g8 e4 a fis d
    R1.
    r4 a'4. fis8 h2 g8[ e]
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ son, e -- lei -- son,

  Ky -- ri -- e "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Ben andante" \autoBeamOff
    R1.*2
    r2 c4. a8 d4. h8
    e4. c8 g'4. e8 cis4 d
    a2 d r
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ _ son, e --
  lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Ben andante"
    g4 \clef soprano << {
      g''4. e8 a4. fis8 h4~
      h8 g c4
    } \\ {
      r4 c,4. a8 d4. h8
      e4. c8
    } >> \clef tenor g4. e8 a4. fis8
    h4. g8 \clef bass c,4. a8 d4. h8
    e4. c8 g'4. e8 cis4 d
    a2 d \clef tenor h'4 g8 e
  }
}

BassFigures = \figuremode {
  r1.
  r2 <5 4>4 <6 3> <10 5>2
  <5>4 <6> <5> <6> <5> <6>
  <5> <6>2. <6 5>2
  <4>4 <_+> <5> <6> <3> <6>
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
