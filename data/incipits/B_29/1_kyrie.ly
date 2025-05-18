\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagiosè"
    a'4. h8 gis4 r
    r8 g4 a8 fis4 r
    r8 d g a h8. c16 d4~
    d8 e c4. h8 \hA c4
    h8 h e8. d16 cis8 d16 e a,8.\trill h32 cis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagiosè"
    fis4. d8 e4 r
    r8 e4 cis8 d4 r
    r2 r8 d h' a
    gis4 a4. \hA gis8 a4
    gis r r8 e a8. g16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Adagiosè" \autoBeamOff
    a'4.^\tuttiE h8 gis4 r
    r8 g4 a8 fis4 r
    r8 d g[ a] h8.[ c16] d4~
    d8[ e] c4. h8 \hA c4
    h8 h e8.[ d16] cis8[ d16 e] a,8.[\trill h32 cis]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- son,
  e -- lei -- _ _
  _ _ _
  son, e -- lei -- _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Adagiosè" \autoBeamOff
    fis4.^\tutti d8 e4 r
    r8 e4 cis8 d4 r
    r2 r8 d h'[ a]
    gis4 a4. \hA gis8 a4
    gis r r8 e a8.[ g16]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- son,
  e -- lei --
  _ _ _ _
  son, e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \tempoMarkup "Adagiosè" \autoBeamOff
    r2 h4.^\tutti gis8
    a4 r r8 a4 fis8
    g!4 r r8 g4 a8
    h[ c] a8.[ g!16] fis!4 fis'~
    fis8 e r gis, a8.[ h32 cis] d8[ e]
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- _
  lei -- _ _ _
  son, e -- lei -- \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Adagiosè" \autoBeamOff
    r2 d4.^\tutti e8
    cis4 r r8 c4 d8
    h4 h'8[ a] g4. f8
    e4. f8 dis2
    e4 r8 e a8.[ g!16] fis8.[ e16]
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- lei -- _
  son, e -- lei --
  son, e -- lei -- \hy
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Adagiosè"
    d4-\tutti r d4. e8
    cis4 r r8 c4 d8
    h4 h'8 a g4. f8
    e4. f8 dis2
    e4 r8 e a8. g!16 fis8. e16
  }
}

BassFigures = \figuremode {
  r2 <4\+ 2>4. <\t \t>8
  <6>2 r8 <4\+ 2>4 <\t \t>8
  <6>1
  <7 _+>4 <6! 4>8 <\t \t> <7 5>2
  <9 _+>8 <8 \t>4. <_+>2
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
