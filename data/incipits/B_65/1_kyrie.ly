\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "Presto"
    a'8. a16 b4 r8 a g c~
    c b a d d cis d4
    a8 d d c d4 cis8 d
    e4 a, r2
    a8. a16 b4 r8 a g c~
    c b a d~ d16 c d e f e d c
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "Presto"
    a'8. a16 b4 r8 a g c~
    c b a d d cis d4
    a8 d d c d4 cis8 d
    e4 a, r2
    a8. a16 b4 r8 a g c~
    c b a d~ d16 c d e f e d c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    a'8.^\tutti a16 b4 r8 a g[ c]~
    c[ b] a d d[ cis] d4
    a8 d4 c8 d4 cis8[ d]
    e4 a, r2
    a8. a16 b4 r8 a g[ c]~
    c[ b] a d d16[ c d e] f[ e d c]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- _
  son, Ky -- ri -- e e --
  lei -- son,
  Ky -- ri -- e e -- lei --
  son, e -- lei -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    r4 d8.^\tutti d16 f4 r8 e
    d g4 f8 e[ a] f4
    d8. d16 e4 r8 d e[ f]
    g4 f8 a a[ g] a4
    r d,8. d16 f4 r8 e
    d g4 f8 e f16[ g] a[ g f e]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ _ son,
  Ky -- ri -- e e -- lei --
  _ son, e -- lei -- son,
  Ky -- ri -- e e --
  lei -- _ _ son, e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1
    r2 a8.^\tutti a16 b4
    r8 a g c4 b8 a d~
    d cis d e d4 cis8 cis
    d[ d16 c] b8[ g] a d d[ c]
    g4 d r2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- _ _ son, Ky --
  ri -- e e -- lei -- son, e --
  lei -- _ son, e -- lei --
  _ son,
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1
    r2 r4 d8.^\tutti d16
    f4 r8 e d g4 f8
    e4 d8 c b4 a8 a'16[ g]
    f8[ d] g4 d r
    R1
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei -- _ _
  _ son, e -- lei -- son, e --
  lei -- _ son,
}

Organo = {
  \relative c {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "Presto"
    << {
      a''8. a16 b4 r8 a g c~
      c b a d
    } \\ {
      r4-\tutti d,8. d16 f4 r8 e
      d g g f
    } >> \clef tenor a,4 \clef bass d,8. d16
    f4 r8 e d g g f
    e4 d8 c b4 a8 a'16 g
    f8 d g4 d \clef tenor d'8 c
    g4 d \clef soprano << { d''16 c d e f e d c } \\ { e,8 f16 g a g f e } >>
  }
}

BassFigures = \figuremode {
  r1
  r2 <4 5>8 <_+> <3 6->4
  r4. <6!>8 <7> <_-> <4\+ 2> <6>
  <7> <6\\>4 r8 <7> <6> <_+>4
  r <_->2 <4>8 <8 3>
  <4 5> <_-> <5 4> <8 3> r2
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
        \set Staff.instrumentName =  \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName =  \markup \center-column { "T" "trb 2" }
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
