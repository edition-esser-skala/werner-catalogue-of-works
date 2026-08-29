\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Barmherzigkheit" r8 b' b b g \hA b
    b f r4 \hA b8 b c d
    es es r \hA es b c des c
    c c r es d a c h
    h4 r8 c as c c8. g16
  }
}

SoliLyrics = \lyricmode {
  Nun -- mehr iſts ſchon ge --
  ſchloſ -- ſen, daß der Sün -- der
  le -- be, ſein Hertz zu Gott er --
  he -- be in di -- ſer Zeit -- lich --
  kheit. Wür ſeynd hier -- zue "be -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*4
    r4 r8 g' f f d8. d16
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*4
    r4 r8 es c c c8. h!16
  }
}

BassoIeII = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*4
    r4 r8 es f as g8. g16
  }
}

SABBLyrics = \lyricmode {
  Wür ſeynd hier -- zue "be -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    es1
    d
    c2 g
    as fis
    g4 es f g
  }
}

BassFigures = \figuremode {
  r1
  <6->
  <_->2 <6 _->
  r1
  <_!>2 <_->4 <4>8 <_!>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "soli" "S" }
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \SABBLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \SABBLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "B 1" "B 2" }
        \new Voice = "Basso" { \dynamicUp \BassoIeII }
      }
      \new Lyrics \lyricsto Basso \SABBLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
