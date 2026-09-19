\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 e'4. e8
    e4 d c2\trill
    h a8 h c d
    e d16 c h8 c d c16 h a8 h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1
    a'4. a8 a4 g
    f8 g a g16 f e8 f g f16 e
    d8 e f e16 d c8 d e f
    g4. f16 e d8 e f e16 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1
    r2 e'4.^\tutti e8
    e4 d c2\trill
    h a8[ h c d]
    e[ d16 c] h8[ c] d[ c16 h] a8[ h]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e --
  lei -- _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1
    a'4.^\tutti a8 a4 g
    f8[ g] a[ g16 f] e8[ f] g[ f16 e]
    d8[ e] f[ e16 d] c8[ d e f]
    g4. f16[ e] d8[ e] f[ e16 d]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ son, e --
  lei -- _ _
  _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 e4.^\tutti e8
    e4 d c8[ h16 a] h8[ e]
    a,4. h8 c[ h16 a] g8[ a]
    h[ a16 g] f8[ g] a g4 f8
    e[ f] g2 r4
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei -- _
  son, e -- lei -- _
  _ _ son, e -- _
  lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a'4.^\tutti a8 a4 g
    f2\trill e
    d8[ e f g] a[ g16 f] e8[ f]
    g[ f16 e] d8[ e] f e4 d8
    c[ d] e[ d16 c] h8[ c] d[ c16 h]
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son,
  e -- lei -- _
  _ _ son, e -- _
  lei -- _ _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    a'4.-\tutti-! a8-! << { e'4. e8 } \\ { a,4 g } >>
    f2 e
    d8 e f g a g16 f e8 f
    g f16 e d8 e f e4 d8
    c d e d16 c h8 c d c16 h
  }
}

BassFigures = \figuremode {
  r1
  <3 7>4 <\t 6> <8 4 6> <\t 3>
  <9> <6> <5> <6>
  <5> <8 6>4. <5>8 <6> <8>
  <5>4 q <6> <8 3>
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
