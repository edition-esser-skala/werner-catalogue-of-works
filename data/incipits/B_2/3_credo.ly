\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*4
    r2 r d'4 g~
    g f8 e f4 g a h,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*5
    g'4 c2 e8 d c f e d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    a'2^\solo e'4 f e d
    e2 a,4 d c h
    c8[ d] e2 e,4 e d
    e2 r r
    R1.*2
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*2
    r2 r a'4^\solo a
    gis a8 h a4. g8 f4 a~
    a g8[ f] e4. f8 d4. d8
    c2 r r
  }
}

AltoLyrics = \lyricmode {
  vi -- si -- %3
  bi -- li -- um o -- mni -- um et __
  in -- vi -- si -- bi -- li --
  um,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*3
    e4^\solo e cis d8 e d4. c8
    h4 d c a h4. h8
    c2 r r
  }
}

TenoreLyrics = \lyricmode {
  vi -- si -- bi -- li -- um o -- mni --
  um in -- vi -- si -- bi -- li --
  um,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*4
    r2 c4^\solo f g8[ d] e[ f]
    e4 d8 c c'4. h8 a4 g
  }
}

BassoLyrics = \lyricmode {
  et in u -- num
  Do -- mi -- num Je -- _ _ sum
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    a4.-\solo h8 c4 d a h
    c d8 e f2 e4 d
    e c'8 h a4 g f2
    e2 a4 a, d f
    g h, c f g g,
    c c' a e f g
  }
}

BassFigures = \figuremode {
  r2 <6>1
  q2 <5>4 <6> q q
  q2. r4 <7> <6>
  <_+>2 q1
  <9>4 <6>2. <4>4 <_!>
  r2 <6>4 r2.
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
