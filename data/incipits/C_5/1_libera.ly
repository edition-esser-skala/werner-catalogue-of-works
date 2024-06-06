\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
    \time 13/4 s4*13 \bar "||"
    \time 4/2 d1 e
    f2 fis g a
    b1 a
    g f
    e d
    d r
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
    \time 13/4 s4*13 \bar "||"
    \time 4/2 r2 d1 cis2
    d d d1~
    d2. e4 f2. e8 d
    e1. d2
    d cis d1~
    d r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    \time 13/4 s4*13 \bar "||"
    \time 4/2 d1 e
    f2 fis g a
    b1 a
    g f
    e d
    d r
  }
}

SopranoLyrics = \lyricmode {
  De mor --
  te ae -- ter -- _
  _ na,
  ae -- ter --
  _ na, __
  _
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    \time 13/4 s4*13 \bar "||"
    \time 4/2 r2 d1 cis2
    d d d1~
    d2. e4 f2. e8[ d]
    e1. d2
    d( cis) d1~
    d r
  }
}

AltoLyrics = \lyricmode {
  De mor --
  te ae -- ter --
  _ _ _
  na, ae --
  ter -- na, __
}

Tenore = {
  \relative c' {
    \clef bass
    \key d \dorian \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
      \set Score.caesuraType = #'((breath . chanthalfbar))
    \time 13/4 d,\breve*1/8 d c d f e d e f d c d d \bar "||"
    \clef tenor \time 4/2 a'1 a
    a2 a b c
    b4 c d2 d a
    b a1 b2~
    b a a1~
    a r
  }
}

TenoreLyrics = \lyricmode {
  Li -- be -- _ ra me, Do -- _ _ _ _ mi -- _ ne,
  de mor --
  te ae -- ter -- _
  _ _ _ na, ae --
  ter -- _ _
  _ na, __
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
      \set Score.caesuraType = #'((breath . chanthalfbar))
    \time 13/4 d\breve*1/8 d c d f e d e f d c d d \bar "||"
    \time 4/2 d1 a
    d2. c!4 b2 fis
    g4 a b c d a d2~
    d cis d b
    g a d1~
    d r
  }
}

BassoLyrics = \lyricmode {
  Li -- be -- _ ra me, Do -- _ _ _ _ mi -- _ ne,
  de mor --
  te ae -- ter -- _
  _ _ _ _ _ _ _
  _ na, ae --
  ter -- _ na, __
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
    \time 13/4 s4*13 \time 4/2 \normalsize \bar "||"
    d1 a
    d2. c!4 b2 fis
    g4 a b c d a d2~
    d cis d b
    g a d1
    d\breve
  }
}

BassFigures = \figuremode {
  s4*13
  r1 <4>2 <_+>
  <_!> <_+> <6> <6 5>
  <_->1 <5>2 <3>
  <6- 4 2> <6 5> <9> <5>
  <6 5> <_+> <5>1
  <\t>\breve
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
