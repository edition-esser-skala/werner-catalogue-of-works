\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
      \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    r2 g'8^\solo b a g
    a g16 f c'4. d8 c[ h]
    c4 r es16[ d] c[ \hA es] d4
  }
}

SopranoLyrics = \lyricmode {
  Et in u -- num
  Do -- mi -- num Je -- sum Chri --
  stum, Je -- sum "Chri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r4 d8.^\solo d16 cis8 d16 e f8 e16 d
    c8 b a f' f4. e8
    f4 r d8 f e d
    e d16 c g'4. a8 fis4
  }
}

AltoLyrics = \lyricmode {
  vi -- si -- bi -- li -- um o -- mni -- um
  et in -- vi -- si -- bi -- li --
  um. Et in u -- num
  Do -- mi -- num Je -- sum "Chri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d4 a8 f' e d cis4
    d8 c b a b[ d] c b
    a4. g8 a4 r
    R1*2
    r2 a8 c b a
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- _ rae,

  et ex Pa -- tre
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    r2 r4 c'8^\solo b16 c
    f,8 a e c f16[ e d f] g8 g,
    c4 r r2
  }
}

BassoLyrics = \lyricmode {
  Fi -- li -- um
  De -- i u -- ni -- ge -- _ ni --
  tum,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d8-\solo e f d g b a g
    fis4 r8 d g f e g
    f d b4 a d
    e f8 d b g c c,
    f f' e c f d g g,
    c c' b! g c, a d d,
  }
}

BassFigures = \figuremode {
  r2 <6>4 <_+>
  r2 r8 <6> q4
  r <7>8 <6> <_+>2
  r <6 5>
  r <6 5>4 <6 4>8 <5 _!>
  r2 <6 5 _->4 <6 _+>8 <5 \t>
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
