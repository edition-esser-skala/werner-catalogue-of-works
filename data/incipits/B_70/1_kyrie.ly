\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    R1*3
    r8 d'4 cis8 f4 e
    r8 d4 c8 b g16 a h c d8
    g, es' d16 c d8 g,4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    r2 r8 g'4 fis8
    b4 a r8 g4 f8
    es16 f g4 f16 es d8 g f e
    d d b' a~ a16 g f8 g a
    d, b' a16 g a8 d, g4 f!8
    es c g'4 r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*3
    r8 d'4^\tutti cis8 f4 e
    r8 d4 c8 b[ g16 a] h[ c d8]
    g, es' d16[ c d8] g,4 r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e __ _
  e -- _ lei -- _
  son, e -- lei -- son,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r2 r8 g'4^\tutti fis8
    b4 a r8 g4 f8
    es16[ f] g4 f16[ es] d8[ g f e]
    d d b'[ a] a16[ g] f8 g[ a]
    d, b' a16[ g a8] d, g4 f!8
    es[ c] g'4 r2
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e __ _ e -- _
  lei -- _ _ _
  son, e -- lei -- son, e -- lei --
  son, e -- lei -- son, e -- _
  lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*2
    r2 r8 d4^\tutti cis8
    f4 e r8 d4 c8
    b[ a16 g] fis4 g r
    r2 c4. h8
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e __ _ e -- _
  lei -- _ son,
  Ky -- "ri -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti fis8 b4 a
    r8 g4 f8 es4 d
    c8[ b16 a] g8[ a] b4 a
    d8[ b' g a] d,4 r
    R1
    c4. h8 es4 d
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e __ _
  e -- _ lei -- son,
  e -- lei -- son, e --
  lei -- son,

  Ky -- ri -- e __ _
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    g'4.-!-\tutti fis8-! b4 a
    r8 g4 f8 es4 d
    c8 b16 a g8 a b4 a
    d8 b' g a d, \clef tenor d'4 c!8
    b a16 g fis4 g8 \clef alto g'4 f8
    \clef bass c,4. h8 es4 d
  }
}

BassFigures = \figuremode {
  r2 <6>4 <7>8 <6\\>
  r <10> <9> <3> q4 <4>8 <3>
  <_-> <6> <8> <6> <5 3> <6> <6 4> <5 _+>
  r4 <6! 5>8 <_+>4 <3>8 <4 2!> <6>
  <6>4 q8 <5>4 <_->8 <_!> <6>
  r4 <5 2>8 r <6>4 <7>8 <6!>
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
