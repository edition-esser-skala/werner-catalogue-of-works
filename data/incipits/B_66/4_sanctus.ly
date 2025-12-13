\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \twotwotime \key d \minor \time 2/2 \tempoMarkup "Allabreve"
    R1*5
    d2. e4
    f1
    e4 fis g2
    g a
    g g
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \twotwotime \key d \minor \time 2/2 \tempoMarkup "Allabreve"
    R1
    a2. b4
    c1
    b4 c d2~
    d cis
    d a
    a r
    r d~
    d d
    e1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key d \minor \time 2/2 \tempoMarkup "Allabreve"
    R1*6
    a'2. b4
    c1
    b4 c d2~
    d4 cis d e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key d \minor \time 2/2 \tempoMarkup "Allabreve"
    R1*6
    a'2. b4
    c1
    b4 c d2~
    d4 cis d e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
    R1*6
    a'2. b4
    c1
    b4 c d2~
    d4 cis d e
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  ctus,
  san -- _ _
  _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
    R1*5
    d2. e4
    f1
    e4 fis g2~
    g a
    g g
  }
}

AltoLyrics = \lyricmode {
  San -- _
  ctus,
  san -- _ _
  ctus,
  san -- ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
    R1
    a2. b4
    c1
    b4 c d2~
    d cis
    d a
    a r
    r d~
    d d
    e1
  }
}

TenoreLyrics = \lyricmode {
  San -- _
  ctus,
  san -- _ _
  _
  ctus, san --
  ctus,
  san --
  ctus,
  "san -"
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
    d2. e4
    f1
    e4 fis g2~
    g2. f4
    e g a g
    f2. e4
    d1
    r2 g~
    g f
    e1
  }
}

BassoLyrics = \lyricmode {
  San -- _
  ctus,
  san -- _ _
  ctus,
  san -- _ _ _
  _ _
  ctus,
  san --
  ctus,
  "san -"
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key d \minor \time 2/2 \tempoMarkup "Allabreve"
    d2.-! e4-!
    << {
      a2. b4
      c1
      b4 c d2~
      d
    } \\ {
      f,1
      e4 fis g2~
      g2. f4
      e g
    } >> a g
    f2. e4
    d1
    c2 g'~
    g f
    e1
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r2 <_+>
  <6>2. <6\\>4
  <5>2. <6>4
  <8 3> <\t 4\+> <4>2
  <_-> <6>
  <7>4 <6\\> <7> <8>
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
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
