\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Largo"
    d'4. c8~ c b16 a b4\trill
    a2 r8 es'!4 d8~
    d c16 h c8 fis, g g h d
    es4. es8 es4 d~
    d cis c b~
    b8 a4 b8 a4 g\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Largo"
    f4. f8 d4. e8
    fis2 g4. f8~
    f es!16 d es4 d2
    r8 es g b! a4 b
    g4. g8 a4 g~
    g f8 d c2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    d'4.^\tutti c8~ c[ b16 a] b4\trill
    a2 r8 es'!4 d8~
    d[ c16 h] c8[ fis,] g g h d
    es4. es8 es4 d~
    d cis c b~
    b8 a4 b8 a4 g\trill
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _ _
  ve, sal -- _
  _ ve ma -- ter mi --
  se -- ri -- cor -- _
  di -- ae, sal --
  ve Re -- gi \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    f4.^\tutti f8 d4. e8
    fis2 g4. f8~
    f[ es!16 d] es4\trill d2
    r8 es g b! a4 b
    g8. g16 g4 a g~
    g f8[ d] c2
  }
}

AltoLyrics = \lyricmode {
  Sal -- ve, sal -- _
  ve, sal -- _
  _ ve
  ma -- ter mi -- se -- ri --
  cor -- di -- ae, sal -- ve __
  Re -- "gi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    b4.^\tutti a8~ a[ g16 fis] g8[ cis]
    d2 b4. b8
    g4. a8 h2
    r8 c c b c c b4~
    b8 b b4 a8 d4 d8
    e4 f2 \hA e4
  }
}

TenoreLyrics = \lyricmode {
  Sal -- _ _
  ve, sal -- ve,
  sal -- _ ve
  ma -- ter mi -- se -- ri -- cor --
  di -- ae, sal -- _ ve
  Re -- _ "gi -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    b'4^\tutti f g4. g,8
    d'2 es4 b
    c2 g
    r8 c es g f4 g
    es e fis g
    c, d8[ b] c2
  }
}

BassoLyrics = \lyricmode {
  Sal -- ve, sal -- _
  ve, sal -- ve,
  sal -- ve
  ma -- ter mi -- se -- ri --
  cor -- di -- ae, sal --
  ve Re -- "gi -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Largo"
    b'4-\tutti f g4. g,8
    d'2 es4 b
    c4. c,8 g'2
    r8 c es g f4 g
    es e fis g
    c, d8 b c2
  }
}

BassFigures = \figuremode {
  r4 <6 4>8 <5 3> <9 4> <8 3>4 <6 4\+>8
  <_+>2 <5>4 <6 4>8 <5 3>
  <9 4> <8 3>4 <6 4\+>8 <_!>2
  r4. <6>8 <7>4 <5>
  <7> <6\\> <5!>2
  <7 _!>8 <6 \t> <5>4 <6 4> <5 _!>
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
