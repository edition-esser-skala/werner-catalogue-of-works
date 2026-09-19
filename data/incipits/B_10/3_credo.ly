\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4^\solo d,8 d' cis h
    a8.[ g16] fis8 a d a
    h cis16 d g,4. fis8
    e4 r r
    r d'4. cis!8
    h e cis8. h16 a8 d~
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae,
  et in
  u -- num Do -- mi -- num "Je -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 r e8^\solo d
    cis cis16 cis d8 e fis d~
    d16[ e] fis8 g a h[ e,]~
    e e e4 r
  }
}

AltoLyrics = \lyricmode {
  vi -- si -- %3
  bi -- li -- um o -- mni -- um et __
  in -- vi -- si -- bi --
  li -- um,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    r4 a8^\solo g fis fis16 fis
    g8 a h a gis a
    a gis a4 r
  }
}

TenoreLyrics = \lyricmode {
  vi -- si -- bi -- li -- um
  o -- mni -- um, in -- vi -- si --
  bi -- li -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*5
    r4 r fis8^\solo h
  }
}

BassoLyrics = \lyricmode {
  et ex
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d8.-\solo e16 fis8 d e g
    fis cis d8. e16 fis4
    g8 fis e e' cis d
    a8. g16 fis8 e d8. c16
    h8 a << { g' f e a } \\ { g,4 } >>
    e'8 e, a a' fis h
  }
}

BassFigures = \figuremode {
  r2 <6\\>8 <3>
  <6> q4. q4
  r2 <6 5>4
  r r2
  <6>8 <6\\>4 r8 <7 _+> <_+>
  <4> <_+>4. r4
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
