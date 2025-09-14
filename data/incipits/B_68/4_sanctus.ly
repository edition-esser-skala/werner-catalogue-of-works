\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Presto"
    R1*2
    d'4. e8 cis a d4~
    d8 cis16 h \hA cis4 d2
    r r8 g4 f8
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Presto"
    R1
    r2 g'4. a8
    fis d g4. fis8 fis e16 d
    e8 a4 g8 fis d e fis
    g2 g,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1*2
    d'4. e8 cis[ a] d4~
    d8[ cis16 h] \hA cis4 d2
    r r8 g4 f8
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _ _
  _ ctus,
  san -- ctus
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1
    r2 g'4. a8
    fis[ d] g4. fis8 fis[ e16 d]
    e8 a4 g8 fis([ d)] e fis
    g2 g,
  }
}

AltoLyrics = \lyricmode {
  San -- _
  _ _ _ _
  ctus, san -- ctus Do -- mi -- nus
  De -- us,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    r2 d4. e8
    cis[ a] d4. \hA cis16[ h] \hA cis4
    d8[ c] h4 a2~
    a d,8 d'4 c!8
    h[ g] a h c4 d
  }
}

TenoreLyrics = \lyricmode {
  San -- _
  _ _ _ _
  _ ctus, san --
  ctus, san -- ctus
  Do -- mi -- nus De -- us,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    g'4. a8 fis[ d] g4~
    g8[ fis] fis[ e16 d] e2
    d4 r r2
    R1
    r8 g4 f8 e4 h8 h
  }
}

BassoLyrics = \lyricmode {
  San -- _ _ _
  _ _
  ctus,

  san -- ctus Do -- mi -- nus
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Presto"
    << {
      s2 d'4. e8
      cis a d4
    } \\ {
      g,4. a8 fis d g4~
      g8 fis fis e16 d
    } >> e2
    d4 \clef tenor h' a2~
    a d,8 d'4 c!8
    h \clef bass g4 f8 e4 h
  }
}

BassFigures = \figuremode {
  r1
  r2 <3 7>4 <_ 6\\>
  r <6> <7 _+> <6 4>
  <5 \t> <\t _+>2.
  r4. <\t>8 <6>4 q
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
