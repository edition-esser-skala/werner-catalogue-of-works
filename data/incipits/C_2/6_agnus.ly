\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 5/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*5 \bar "||"
    \time 4/4 r2 r4 a'~
    a g f e8 fis
    g4 g, r2
    g'2. f4
    e2 d4 e
    f8 c f2 e4
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 5/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*5 \bar "||"
    \time 4/4 d2. c4
    b2 a
    r4 d cis8 cis d4~
    d cis r d~
    d c b2
    c r
  }
}

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 5/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*5 \bar "||"
    \time 4/4 R1
    d'2. c4
    b2 a4. a8
    e'2 a,
    r r4 b~
    b a g4. a8
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 5/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*5 \bar "||"
    \time 4/4 r2 r4 a'~
    a g f e8 fis
    g4 g, r2
    g'2. f4
    e2 d4 e
    f8 c f2 e4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 5/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    R4*5 \bar "||"
    \time 4/4 R1
    d'2. c4
    b2 a4. a8
    e'2 a,
    r r4 b~
    b a g g8 a
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis,
  a --
  gnus De -- i, qui
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 5/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    R4*5 \bar "||"
    \time 4/4 r2 r4 a'~
    a g f e8 fis
    g4 g, r2
    g'2. f4
    e2 d4 e
    f8 c f2 e4
  }
}

AltoLyrics = \lyricmode {
  A -- %2
  gnus De -- i, qui
  tol -- lis,
  a -- gnus
  De -- i, qui
  tol -- lis, a -- gnus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 5/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    R4*5 \bar "||"
    \time 4/4 d2.^\tutti c4
    b2 a
    r4 d cis8 cis d4~
    d cis r d~
    d c b2
    c r
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De -- i,
  pec -- ca -- ta mun --
  di, a --
  gnus De --
  i,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 5/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    g'\breve*1/8 f g a a \bar "||"
    \time 4/4 R1*2
    g2.^\tutti f4
    e2 d
    r4 a'2 g4
    f2 c4 c
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- _ i.

  A -- gnus De -- i,
  a -- gnus
  De -- i, qui
  tol -- lis "pec -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 5/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    g'\breve*1/8 f g a a \bar "||"
    \time 4/4 d,4-\tutti f8 d a'2
    b a
    g2. f4
    e2 d
    a'2. g4
    f2 c
  }
}

BassFigures = \figuremode {
  r4*5
  r2 <4>4 <3>
  <7> <6> <6 4> <5 3>8 <6\\>
  r2 <4\+ 2>4 <6>
  <7> <6\\> <4> <3>
  <4> <3> <4 2-> <6>
  <4> <3> <5 4> <\t 3>8 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
        % \transpose c c,
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
